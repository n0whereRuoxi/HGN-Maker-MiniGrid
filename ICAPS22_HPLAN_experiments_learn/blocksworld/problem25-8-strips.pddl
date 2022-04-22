( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b255 - block
    b681 - block
    b662 - block
    b629 - block
    b177 - block
    b468 - block
    b877 - block
    b994 - block
    b27 - block
    b33 - block
    b410 - block
    b170 - block
    b233 - block
    b108 - block
    b934 - block
    b867 - block
    b9 - block
    b777 - block
    b863 - block
    b520 - block
    b34 - block
    b475 - block
    b765 - block
    b691 - block
    b980 - block
    b827 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b255 )
    ( on b681 b255 )
    ( on b662 b681 )
    ( on b629 b662 )
    ( on b177 b629 )
    ( on b468 b177 )
    ( on b877 b468 )
    ( on b994 b877 )
    ( on b27 b994 )
    ( on b33 b27 )
    ( on b410 b33 )
    ( on b170 b410 )
    ( on b233 b170 )
    ( on b108 b233 )
    ( on b934 b108 )
    ( on b867 b934 )
    ( on b9 b867 )
    ( on b777 b9 )
    ( on b863 b777 )
    ( on b520 b863 )
    ( on b34 b520 )
    ( on b475 b34 )
    ( on b765 b475 )
    ( on b691 b765 )
    ( on b980 b691 )
    ( on b827 b980 )
    ( clear b827 )
  )
  ( :goal
    ( and
      ( clear b255 )
    )
  )
)
