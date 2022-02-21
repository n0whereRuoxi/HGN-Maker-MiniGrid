( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b333 - block
    b227 - block
    b45 - block
    b128 - block
    b660 - block
    b570 - block
    b201 - block
    b631 - block
    b359 - block
    b701 - block
    b714 - block
    b680 - block
    b727 - block
    b311 - block
    b87 - block
    b129 - block
    b844 - block
    b620 - block
    b717 - block
    b280 - block
    b195 - block
    b962 - block
    b437 - block
    b255 - block
    b749 - block
    b986 - block
    b303 - block
    b176 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b333 )
    ( on b227 b333 )
    ( on b45 b227 )
    ( on b128 b45 )
    ( on b660 b128 )
    ( on b570 b660 )
    ( on b201 b570 )
    ( on b631 b201 )
    ( on b359 b631 )
    ( on b701 b359 )
    ( on b714 b701 )
    ( on b680 b714 )
    ( on b727 b680 )
    ( on b311 b727 )
    ( on b87 b311 )
    ( on b129 b87 )
    ( on b844 b129 )
    ( on b620 b844 )
    ( on b717 b620 )
    ( on b280 b717 )
    ( on b195 b280 )
    ( on b962 b195 )
    ( on b437 b962 )
    ( on b255 b437 )
    ( on b749 b255 )
    ( on b986 b749 )
    ( on b303 b986 )
    ( on b176 b303 )
    ( clear b176 )
  )
  ( :goal
    ( and
      ( clear b333 )
    )
  )
)
