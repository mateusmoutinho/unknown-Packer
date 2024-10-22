
#include "../unique.definition_requirements.h"

long  pack_folder(CTextStack *data,const char *folder) {
    DtwStringArray *listage = dtw.list_all_recursively(folder,false);
    long listage_size = listage->size;
    for(int i=0; i < listage->size;i++) {

        stack.text(data,"\n\t{\n");
        char *item = listage->strings[i];
        stack.format(data,"\t\t.path=\"%s\",\n",item);
        char *full_path = dtw.concat_path(folder,item);
        if(dtw.entity_type(full_path) == DTW_FILE_TYPE) {
            long size;
            bool is_binary;
            unsigned char *content = dtw.load_any_content(full_path,&size,&is_binary);
        /// stack.format(data,"\t\t.exist=true,\n");
            stack.format(data,"\t\t.size=%d,\n",size);
            stack.format(data,"\t\t.is_binary=%s,\n",is_binary? "true":"false");
            stack.format(data,"\t\t.content=\"");
            parse_bin(data,content,size);
            stack.format(data,"\"\n");
        }

        free(full_path);
        stack.text(data,"\t},\n");

    }
    dtw.string_array.free(listage);
    return  listage_size;
}


void create_bins(){

    UniversalGarbage *garbage = newUniversalGarbage();

    CTextStack *data = stack.newStack_string_empty();
    stack.text(data,"#include \"../types/all.h\"\n");
    stack.text(data,"Bin bins[] = {");
    long size = pack_folder(data,"bin/all");

    stack.text(data,"#ifdef __linux__ \n");

    long total_linux =  pack_folder(data,"bin/linux");

    #ifdef __linux__
        size+=total_linux;
    #endif
    stack.text(data,"\n#endif\n");
    stack.text(data,"#ifdef _WIN32 \n");
    long total_win=pack_folder(data,"bin/windows");
    #ifdef _WIN32
        size+=total_win;
    #endif
    stack.text(data,"\n#endif\n");

    stack.text(data,"};\n");
    stack.format(data,"int bins_size = %d;\n",size);

    dtw.write_string_file_content(BIN_COUDE,data->rendered_text);

    stack.free(data);

}
