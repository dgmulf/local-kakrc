declare-option str project_directory
declare-option bool source_local_kakrc false

hook global KakBegin .* %{
    evaluate-commands %sh{
        if [ $kak_opt_source_local_kakrc = true ]; then
            while [ "$PWD" != "/" ]; do
                if [ -f .kakrc ]; then
                    printf %s\\n "set-option global project_directory '$PWD'"
                    printf %s\\n "source '$PWD/.kakrc'"
                    break
                fi
                cd ..
            done
        fi
    }
}
