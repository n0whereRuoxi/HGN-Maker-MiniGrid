( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b107 - block
    b813 - block
    b251 - block
    b893 - block
    b83 - block
    b426 - block
    b801 - block
    b428 - block
    b699 - block
    b301 - block
    b478 - block
    b502 - block
    b542 - block
    b250 - block
    b785 - block
    b100 - block
    b835 - block
    b915 - block
    b171 - block
    b940 - block
    b937 - block
    b992 - block
    b859 - block
    b98 - block
    b664 - block
    b526 - block
    b504 - block
    b993 - block
    b177 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b107 )
    ( on b813 b107 )
    ( on b251 b813 )
    ( on b893 b251 )
    ( on b83 b893 )
    ( on b426 b83 )
    ( on b801 b426 )
    ( on b428 b801 )
    ( on b699 b428 )
    ( on b301 b699 )
    ( on b478 b301 )
    ( on b502 b478 )
    ( on b542 b502 )
    ( on b250 b542 )
    ( on b785 b250 )
    ( on b100 b785 )
    ( on b835 b100 )
    ( on b915 b835 )
    ( on b171 b915 )
    ( on b940 b171 )
    ( on b937 b940 )
    ( on b992 b937 )
    ( on b859 b992 )
    ( on b98 b859 )
    ( on b664 b98 )
    ( on b526 b664 )
    ( on b504 b526 )
    ( on b993 b504 )
    ( on b177 b993 )
    ( clear b177 )
  )
  ( :goal
    ( and
      ( clear b107 )
    )
  )
)
