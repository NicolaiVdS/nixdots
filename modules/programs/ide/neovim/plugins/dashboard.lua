local status, plugin = pcall(require, 'dashboard')
if not status then
    print('Error with plugin: ', plugin)
    return
end

plugin.setup {
    theme = 'doom',
    config = {
        header =  randomsplash()
    }
}