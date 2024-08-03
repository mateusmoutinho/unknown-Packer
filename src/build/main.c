

#include "definition.c"

int main(){
    dtw = newDtwNamespace();
    stack = newCTextStackModule();

    int error = create_lua_code();
    if(error){
        return error;
    }
    create_bins();


    CTextStack *final_linux_compilation = stack.newStack_string_format("gcc c/main.c -o ../%s",FINAL_OUPTUT_LINUX);
    error = system(final_linux_compilation->rendered_text);
    stack.free(final_linux_compilation);
    if(error){
        return error;
    }



    CTextStack *final_windows_compilation = stack.newStack_string_format("x86_64-w64-mingw32-gcc c/main.c -o ../%s",FINAL_OUPTUT_WINDOS);
    error = system(final_windows_compilation->rendered_text);
    stack.free(final_windows_compilation);
    if(error){
        return error;
    }



    #ifdef  RUN_AFTER

    CTextStack *run_command = stack.newStack_string_format("./%s",FINAL_OUPTUT);
        error = system(run_command->rendered_text);
        stack.free(run_command);

        if(error){
            return error;
        }
    #endif


    return 0;
}
