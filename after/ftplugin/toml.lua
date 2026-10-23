-- Chỉ áp dụng cho Cargo.toml: phím tắt quản lý dependency của crates.nvim.
if vim.fn.expand("%:t") ~= "Cargo.toml" then
  return
end

local ok, crates = pcall(require, "crates")
if not ok then
  return
end

local bufnr = vim.api.nvim_get_current_buf()

-- Bỏ qua lặng lẽ nếu crates.nvim đổi/bỏ một API nào đó, thay vì ném lỗi
-- làm hỏng toàn bộ ftplugin.
local function map(lhs, rhs, desc, mode)
  if type(rhs) ~= "function" then
    return
  end
  vim.keymap.set(mode or "n", lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
end

map("<leader>Rt", crates.toggle, "Bật/tắt crates.nvim")
map("<leader>Rr", crates.reload, "Tải lại thông tin crate")

map("<leader>Rv", crates.show_versions_popup, "Danh sách version")
map("<leader>Rf", crates.show_features_popup, "Danh sách feature")
map("<leader>Rd", crates.show_dependencies_popup, "Dependency của crate")

map("<leader>Ru", crates.update_crate, "Update crate này")
map("<leader>Ra", crates.update_all_crates, "Update tất cả crate")
map("<leader>RU", crates.upgrade_crate, "Upgrade crate này (đổi version)")
map("<leader>RA", crates.upgrade_all_crates, "Upgrade tất cả crate")
map("<leader>Ru", crates.update_crates, "Update crate đã chọn", "x")
map("<leader>RU", crates.upgrade_crates, "Upgrade crate đã chọn", "x")

map("<leader>Rx", crates.expand_plain_crate_to_inline_table, "Mở rộng thành inline table")
map("<leader>RX", crates.extract_crate_into_table, "Tách crate ra section riêng")

map("<leader>Rh", crates.open_homepage, "Mở homepage")
map("<leader>Ro", crates.open_documentation, "Mở docs.rs")
map("<leader>Rc", crates.open_crates_io, "Mở crates.io")
map("<leader>Rg", crates.open_repository, "Mở repository")
map("<leader>Rl", crates.open_lib_rs, "Mở lib.rs")
map("<leader>RG", crates.use_git_source, "Đổi sang git source")

local ok_wk, wk = pcall(require, "which-key")
if ok_wk then
  wk.add({ "<leader>R", group = "Crates", buffer = bufnr, icon = "📦" })
end
