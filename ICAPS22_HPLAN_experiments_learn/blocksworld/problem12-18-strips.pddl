( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b881 - block
    b765 - block
    b543 - block
    b73 - block
    b575 - block
    b79 - block
    b527 - block
    b105 - block
    b460 - block
    b714 - block
    b307 - block
    b841 - block
    b468 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b881 )
    ( on b765 b881 )
    ( on b543 b765 )
    ( on b73 b543 )
    ( on b575 b73 )
    ( on b79 b575 )
    ( on b527 b79 )
    ( on b105 b527 )
    ( on b460 b105 )
    ( on b714 b460 )
    ( on b307 b714 )
    ( on b841 b307 )
    ( on b468 b841 )
    ( clear b468 )
  )
  ( :goal
    ( and
      ( clear b881 )
    )
  )
)
