command! -nargs=0 QPF try
                  \|      cp
                  \| catch
                  \|    try
                  \|      cfirst
                  \|    catch
                  \|      echo "No locations :O"
                  \|    endtry
                  \| endtry

command! -nargs=0 QNL try
                  \|      cn
                  \| catch
                  \|    try
                  \|      clast
                  \|    catch
                  \|      echo "No locations :P"
                  \|    endtry
                  \| endtry

command! -nargs=0 LPF try
                  \|      lp
                  \| catch
                  \|    try
                  \|      lfirst
                  \|    catch
                  \|      echo "No errors :)"
                  \|    endtry
                  \| endtry

command! -nargs=0 LNL try
                  \|      lne
                  \| catch
                  \|    try
                  \|      llast
                  \|    catch
                  \|      echo "No errors :D"
                  \|    endtry
                  \| endtry
