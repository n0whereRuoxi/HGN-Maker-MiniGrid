( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b722 - block
    b617 - block
    b319 - block
    b614 - block
    b461 - block
    b664 - block
    b218 - block
    b379 - block
    b145 - block
    b442 - block
    b366 - block
    b95 - block
    b46 - block
    b841 - block
    b867 - block
    b507 - block
    b380 - block
    b390 - block
    b410 - block
    b152 - block
    b284 - block
    b248 - block
    b828 - block
    b496 - block
    b289 - block
    b600 - block
    b454 - block
    b672 - block
    b702 - block
    b170 - block
    b862 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b722 )
    ( on b617 b722 )
    ( on b319 b617 )
    ( on b614 b319 )
    ( on b461 b614 )
    ( on b664 b461 )
    ( on b218 b664 )
    ( on b379 b218 )
    ( on b145 b379 )
    ( on b442 b145 )
    ( on b366 b442 )
    ( on b95 b366 )
    ( on b46 b95 )
    ( on b841 b46 )
    ( on b867 b841 )
    ( on b507 b867 )
    ( on b380 b507 )
    ( on b390 b380 )
    ( on b410 b390 )
    ( on b152 b410 )
    ( on b284 b152 )
    ( on b248 b284 )
    ( on b828 b248 )
    ( on b496 b828 )
    ( on b289 b496 )
    ( on b600 b289 )
    ( on b454 b600 )
    ( on b672 b454 )
    ( on b702 b672 )
    ( on b170 b702 )
    ( on b862 b170 )
    ( clear b862 )
  )
  ( :goal
    ( and
      ( clear b722 )
    )
  )
)
