if game.Players.LocalPlayer.Name == "1xToxsins" then
    print("not executed")
else
    local mt = getrawmetatable(game)
    local old = mt.__namecall
    setreadonly(mt, false)

    mt.__namecall =
        newcclosure(
        function(self, ...)
            local args = {...}
            local method = getnamecallmethod()

            if method == "Fire" and self.Name == "MessagePosted" then
                return wait(9e9)
            end

            return old(self, ...)
        end
    )

    local CloneFunction = clonefunction
    local CheckCaller = CloneFunction(checkcaller)
    local HookFunction = CloneFunction(hookfunction)
    local LocalPlayer = game.Players.PlayerAdded:wait()

    local PostMessage =
        require(
        LocalPlayer:WaitForChild("PlayerScripts", 1 / 0):WaitForChild("ChatScript", 1 / 0):WaitForChild(
            "ChatMain",
            1 / 0
        )
    ).MessagePosted
    getgenv().MessageEvent = Instance.new("BindableEvent")

    local OldFunctionHook
    local PostMessageHook = function(self, msg)
        if not CheckCaller() and self == PostMessage then
            MessageEvent:Fire(msg)
            return
        end
        return OldFunctionHook(self, msg)
    end
    OldFunctionHook = HookFunction(PostMessage.fire, PostMessageHook)
end
