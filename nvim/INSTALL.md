# COMPLETE CLEAN INSTALL - This WILL Work

## 🧹 Step 1: Nuclear Cleanup (IMPORTANT!)

Run these commands to remove ALL old neovim data:

```bash
# Remove everything
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim  
rm -rf ~/.cache/nvim
```

**Why?** Old Packer data conflicts with Lazy.nvim. Must start completely fresh.

## 📦 Step 2: Install Config

```bash
# Extract
cd ~/Downloads  # or wherever you downloaded
unzip nvim-final.zip

# Move to config location
mv nvim-final ~/.config/nvim

# Verify structure
ls ~/.config/nvim/lua/plugins/
# Should see: treesitter.lua, lsp.lua, completion.lua, etc.
```

## 🚀 Step 3: First Launch

```bash
nvim
```

What will happen:
1. Lazy.nvim auto-installs (wait ~10 seconds)
2. All plugins start installing (wait ~30 seconds)
3. You'll see the Lazy.nvim UI - **DON'T CLOSE IT YET**
4. Wait until all plugins show ✓ (installed)
5. Press `q` to close Lazy UI

## 🔧 Step 4: Install Treesitter (AFTER plugins install)

```vim
:TSUpdate
```

Wait for it to finish (downloads C, C++, Lua parsers).

## ✅ Step 5: Verify Everything Works

Close and reopen nvim:
```bash
nvim test.cpp
```

Check:
- [ ] Syntax highlighting works
- [ ] `:LspInfo` shows nothing (normal, need to install servers)
- [ ] No errors in `:messages`

## 🛠️ Step 6: Install LSP Servers

```vim
:Mason
```

Install these (press `i` on each):
- clangd (for C/C++)
- pyright (for Python)
- lua-language-server (for Lua)

Close Mason with `q`.

## 🎯 Step 7: Test CP Workflow

```bash
nvim test.cpp
```

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    // TODO: test highlighting
    int n;
    cin >> n;
    cout << n << endl;
    return 0;
}
```

Press `<leader>x` - CompetiTest should start (might ask to add test case first).

## 📁 Final Structure

```
~/.config/nvim/
├── init.lua
├── lua/
│   ├── config/
│   │   ├── lazy.lua
│   │   ├── options.lua
│   │   └── keymaps.lua
│   └── plugins/
│       ├── treesitter.lua      ← Fixed with lazy loading
│       ├── lsp.lua
│       ├── completion.lua
│       ├── telescope.lua
│       ├── competitest.lua
│       ├── ui.lua
│       ├── editor.lua
│       ├── markdown.lua
│       └── fun.lua
├── after/
│   ├── plugin/colors.lua
│   └── snippets/
└── ftdetect/
```

## 🐛 If It Still Doesn't Work

### Treesitter Error Persists?

**Option A: Skip Treesitter** (you can live without it)
```bash
rm ~/.config/nvim/lua/plugins/treesitter.lua
```
Restart nvim. Everything else will work fine.

**Option B: Manual Install**
```bash
cd ~/.local/share/nvim/lazy
git clone https://github.com/nvim-treesitter/nvim-treesitter
cd nvim-treesitter
```
Then in nvim: `:TSUpdate`

### LSP Not Working?
```vim
:Mason
:LspInfo
:LspRestart
```

### Plugins Not Installing?
```vim
:Lazy sync
:Lazy clean
:Lazy restore
```

## 💡 Key Commands

```vim
:Lazy          # Plugin manager
:Mason         # LSP installer
:TSUpdate      # Update treesitter
:checkhealth   # Check everything
```

## 🎯 CP Keybindings

```
<leader>g      Receive test cases (Competitive Companion)
<leader>x      Run test cases
<leader>ar     Add test case
<leader>s      Save
<leader>ff     Find files
```

## ⚠️ Common Mistakes

1. **NOT running the cleanup** - Old packer data will conflict
2. **Closing nvim before plugins finish** - Wait for all ✓ marks
3. **Not running :TSUpdate** - Treesitter won't work without parsers
4. **Not installing LSP servers** - :Mason is required

## ✅ Success Checklist

- [ ] Ran full cleanup (rm -rf commands)
- [ ] Extracted config to ~/.config/nvim
- [ ] Opened nvim, waited for Lazy to finish
- [ ] Ran :TSUpdate
- [ ] Restarted nvim
- [ ] No errors in :messages
- [ ] Installed LSP servers via :Mason
- [ ] Tested with a .cpp file

If you followed all steps = WILL WORK! 🚀

## 📞 Still Having Issues?

1. Show me output of: `nvim --version`
2. Show me: `ls -la ~/.config/nvim/lua/plugins/`
3. Show me errors from: `:messages`

I'll help debug!
