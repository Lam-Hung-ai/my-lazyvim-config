-- Keymap riêng cho buffer Rust. Đặt ở đây (không phải trong spec lazy) để
-- chúng là buffer-local và không đụng keymap mặc định của LazyVim.
-- Lưu ý: KHÔNG set vim.g.rustaceanvim ở file này — nó chạy sau khi plugin init.

local bufnr = vim.api.nvim_get_current_buf()

local function map(lhs, rhs, desc, mode)
  vim.keymap.set(mode or "n", lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
end

local function rustlsp(...)
  local args = { ... }
  return function()
    vim.cmd.RustLsp(#args == 1 and args[1] or args)
  end
end

-- Hover actions thay cho hover thường: xem docs + nhảy tới impl/trait.
map("K", rustlsp("hover", "actions"), "Hover Actions (Rust)")

-- <leader>R = nhóm lệnh Rust, không trùng phím nào của LazyVim.
map("<leader>Ra", rustlsp("codeAction"), "Code Action (grouped)")
map("<leader>Rr", rustlsp("runnables"), "Runnables (chọn)")
map("<leader>RR", rustlsp("run"), "Run (target tại con trỏ)")
map("<leader>Rt", rustlsp("testables"), "Testables")
map("<leader>Rd", rustlsp("debuggables"), "Debuggables (chọn)")
map("<leader>RD", rustlsp("debug"), "Debug (target tại con trỏ)")
map("<leader>Rm", rustlsp("expandMacro"), "Expand Macro")
map("<leader>Rk", rustlsp("rebuildProcMacros"), "Rebuild Proc Macros")
map("<leader>Re", rustlsp("explainError"), "Explain Error (rustc --explain)")
map("<leader>RE", rustlsp("renderDiagnostic"), "Render Diagnostic đầy đủ")
map("<leader>Rn", rustlsp("relatedDiagnostics"), "Diagnostic liên quan")
map("<leader>Rc", rustlsp("openCargo"), "Mở Cargo.toml")
map("<leader>Ro", rustlsp("openDocs"), "Mở docs.rs của item")
map("<leader>Rp", rustlsp("parentModule"), "Nhảy tới module cha")
map("<leader>Rj", rustlsp("joinLines"), "Join Lines (Rust-aware)")
map("<leader>Rf", rustlsp("flyCheck", "run"), "Fly Check (clippy ngay)")
map("<leader>Rl", rustlsp("logFile"), "Mở log rust-analyzer")
map("<leader>Ry", rustlsp("syntaxTree"), "Syntax Tree")
map("<leader>Rg", rustlsp("crateGraph"), "Crate Graph (cần graphviz)")
map("<leader>Rw", rustlsp("workspaceSymbol"), "Symbol cả dependency")
map("<leader>Rh", rustlsp("view", "hir"), "Xem HIR")
map("<leader>Ri", rustlsp("view", "mir"), "Xem MIR")
map("<leader>RJ", rustlsp("moveItem", "down"), "Di chuyển item xuống")
map("<leader>RK", rustlsp("moveItem", "up"), "Di chuyển item lên")

-- bacon: chạy clippy/test nền trong terminal nổi, cập nhật realtime khi lưu file.
-- Bổ sung cho diagnostics của rust-analyzer chứ không thay thế.
local function bacon(job)
  return function()
    if not _G.Snacks or not Snacks.terminal then
      vim.cmd("botright split | terminal bacon " .. job)
      return
    end
    Snacks.terminal.toggle("bacon " .. job, {
      cwd = vim.fs.root(0, { "Cargo.toml" }) or vim.fn.getcwd(),
      win = { position = "float", border = "rounded", width = 0.9, height = 0.85 },
    })
  end
end

map("<leader>Rb", bacon("clippy-all"), "bacon: clippy (watch)")
map("<leader>RB", bacon("nextest"), "bacon: nextest (watch)")

-- SSR: toàn buffer ở normal mode, chỉ vùng chọn ở visual mode.
map("<leader>Rs", rustlsp("ssr"), "Structural Search & Replace")
map("<leader>Rs", rustlsp("ssr"), "Structural Search & Replace", "x")

local ok, wk = pcall(require, "which-key")
if ok then
  wk.add({ "<leader>R", group = "Rust", buffer = bufnr, icon = "🦀" })
end

-- Vạch mốc 100 ký tự = max_width mặc định của rustfmt.
-- Cố ý KHÔNG set textwidth: formatoptions của LazyVim có 'c', nên textwidth
-- sẽ tự ngắt dòng comment khi đang gõ — việc mà rustfmt không làm
-- (wrap_comments mặc định false), dễ gây lệch giữa editor và formatter.
vim.opt_local.colorcolumn = "100"
