-- Define the Run_CPP function
local function Run_CPP()
  local current_file = vim.fn.expand("%:p") -- Full path to the current file
  local current_dir = vim.fn.expand("%:p:h") -- Directory of the current file

  vim.cmd("wa!") -- Save the file

  -- Set the working directory to the directory of the current file
  vim.cmd("lcd " .. current_dir)

  vim.cmd('!g++ -std=c++11"' .. current_file .. '" -o hello')

  -- Open a new split for the output
  vim.cmd("split")
  vim.cmd("resize 10")

  -- Run the compiled executable and redirect the output to the new split
  vim.cmd("term ./hello")
  -- Switch to the quickfix/location window
  vim.cmd("wincmd l") -- Run the compiled code in a terminal
  vim.cmd("startinsert")
  vim.cmd("redraw!")
  vim.cmd("cwindow")
end

local function getClipboardContent()
  local handle = io.popen("pbpaste")
  local clipboardContent = handle:read("*a")
  handle:close()

  local lines = {}
  for line in clipboardContent:gmatch("[^\r\n]+") do
    table.insert(lines, line)
  end

  return lines
end

local function Run_CPP_Auto()
  local current_file = vim.fn.expand("%:p") -- Full path to the current file
  local current_dir = vim.fn.expand("%:p:h") -- Directory of the current file
  --
  vim.cmd("wa!") -- Save the file
  --
  vim.cmd("lcd " .. current_dir)
  --
  vim.cmd('!g++ -std=c++11"' .. current_file .. '" -o hello')
  --
  -- Open a new split for the output
  vim.cmd("split")
  vim.cmd("resize 10")

  -- Get the content of the unnamed register (last yanked or deleted text)
  local clipboardLines = getClipboardContent()

  local temp_file = os.tmpname()
  local temp_file_handle = io.open(temp_file, "w")
  temp_file_handle:write(table.concat(clipboardLines, "\n"))
  temp_file_handle:close()

  -- Feed the input content from the temporary file to the compiled code
  vim.cmd("term ./hello < " .. vim.fn.shellescape(temp_file))
  vim.cmd("wincmd l")
  vim.cmd("startinsert")
  vim.cmd("redraw!")
  vim.cmd("cwindow")
end

-- Telescope configuration
return {
  "nvim-telescope/telescope-file-browser.nvim",
  keys = {
    {
      "<leader>p",
      ":Telescope file_browser path=%:p:h=%:p:h<cr>",
      desc = "Browse Files",
    },
    {
      "<leader>m",
      function()
        Run_CPP()
      end,
      desc = "Run CPP File",
    },
    {
      "<leader>a",
      function()
        Run_CPP_Auto()
      end,
      desc = "Copy test cases",
    },
  },
  config = function()
    require("telescope").load_extension("file_browser")
  end,
}
