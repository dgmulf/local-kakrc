declare-option str project_directory
declare-option bool source_local_kakrc false

hook global KakBegin .* %{
    evaluate-commands %sh{
        if [ $kak_opt_source_local_kakrc = true ]; then
            check="$(pwd)"
            while [ "$check" != "/" ]; do
                if [ -f "$check/.kakrc" ]; then
                    printf %s\\n "set-option global project_directory '${check}'"
                    printf %s\\n "source '${check}/.kakrc'"
                    break
                fi
                check="$(dirname "$check")"
            done
        fi
    }
}
