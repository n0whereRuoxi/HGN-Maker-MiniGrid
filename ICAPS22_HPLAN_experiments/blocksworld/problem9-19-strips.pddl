( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b117 - block
    b502 - block
    b830 - block
    b240 - block
    b125 - block
    b430 - block
    b145 - block
    b141 - block
    b333 - block
    b852 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b117 )
    ( on b502 b117 )
    ( on b830 b502 )
    ( on b240 b830 )
    ( on b125 b240 )
    ( on b430 b125 )
    ( on b145 b430 )
    ( on b141 b145 )
    ( on b333 b141 )
    ( on b852 b333 )
    ( clear b852 )
  )
  ( :goal
    ( and
      ( clear b117 )
    )
  )
)
