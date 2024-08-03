function Get_comand()
    if get_os() == 'linux' then
        return './packer.out'
    end

    if get_os() == 'windows' then
        return 'packer.exe'
    end
end
