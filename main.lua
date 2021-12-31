

local function httpGet(link)
  local studio = game:GetService("RunService"):IsStudio();
if studio then
    return game.ReplicatedStorage.Returngames:Invokeserver(link)
else
    return game:HttpGet(link)
  end

end

local loadstring = function(x)
    local studio = game:GetService("RunService"):IsStudio();
    if studio then
        return game.ReplicatedStorage.Returngames:Invokeserver(x)
    else
        return loadstring (x)
      end
    
    end

    local function search_for_games()
        local games = httpGet ("https://github.com/xravlyn/2700/blob/75336f6d52a8bf3da0c47e7dab00b8060469cf60/games.json")
        local decoded = game:GetService("httpservice"):jsondecode(games)
        for i,v in  pairs(decoded) do
          if v.script and v.gameid == game.gameId then
            return i, true, v.script
          end
        end
        return "Oyun Bulunamadı", false,nil
    end

    local index, gstatus, scr = search_for_games()
    if gstatus then
      loadstring(httpGet(scr))()
    else
      wait(1)
      print("error 1")
    end
