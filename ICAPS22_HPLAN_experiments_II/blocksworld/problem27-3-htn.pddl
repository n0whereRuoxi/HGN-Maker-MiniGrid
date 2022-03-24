( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b780 - block
    b756 - block
    b767 - block
    b876 - block
    b70 - block
    b213 - block
    b148 - block
    b914 - block
    b514 - block
    b750 - block
    b432 - block
    b170 - block
    b907 - block
    b445 - block
    b622 - block
    b363 - block
    b511 - block
    b895 - block
    b944 - block
    b159 - block
    b686 - block
    b10 - block
    b114 - block
    b940 - block
    b745 - block
    b457 - block
    b858 - block
    b626 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b780 )
    ( on b756 b780 )
    ( on b767 b756 )
    ( on b876 b767 )
    ( on b70 b876 )
    ( on b213 b70 )
    ( on b148 b213 )
    ( on b914 b148 )
    ( on b514 b914 )
    ( on b750 b514 )
    ( on b432 b750 )
    ( on b170 b432 )
    ( on b907 b170 )
    ( on b445 b907 )
    ( on b622 b445 )
    ( on b363 b622 )
    ( on b511 b363 )
    ( on b895 b511 )
    ( on b944 b895 )
    ( on b159 b944 )
    ( on b686 b159 )
    ( on b10 b686 )
    ( on b114 b10 )
    ( on b940 b114 )
    ( on b745 b940 )
    ( on b457 b745 )
    ( on b858 b457 )
    ( on b626 b858 )
    ( clear b626 )
  )
  ( :tasks
    ( Make-27Pile b756 b767 b876 b70 b213 b148 b914 b514 b750 b432 b170 b907 b445 b622 b363 b511 b895 b944 b159 b686 b10 b114 b940 b745 b457 b858 b626 )
  )
)
