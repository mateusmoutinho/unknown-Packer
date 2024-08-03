function Get_comand()
    if get_os() == 'linux' then
        return './ginga_packer.out'
    end

    if get_os() == 'windows' then
        return 'ginga_packer.exe'
    end
end
