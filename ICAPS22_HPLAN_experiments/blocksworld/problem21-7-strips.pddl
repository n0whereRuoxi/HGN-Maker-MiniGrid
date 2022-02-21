( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b617 - block
    b584 - block
    b870 - block
    b502 - block
    b658 - block
    b655 - block
    b651 - block
    b806 - block
    b22 - block
    b619 - block
    b252 - block
    b867 - block
    b873 - block
    b659 - block
    b909 - block
    b405 - block
    b703 - block
    b254 - block
    b918 - block
    b627 - block
    b276 - block
    b356 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b617 )
    ( on b584 b617 )
    ( on b870 b584 )
    ( on b502 b870 )
    ( on b658 b502 )
    ( on b655 b658 )
    ( on b651 b655 )
    ( on b806 b651 )
    ( on b22 b806 )
    ( on b619 b22 )
    ( on b252 b619 )
    ( on b867 b252 )
    ( on b873 b867 )
    ( on b659 b873 )
    ( on b909 b659 )
    ( on b405 b909 )
    ( on b703 b405 )
    ( on b254 b703 )
    ( on b918 b254 )
    ( on b627 b918 )
    ( on b276 b627 )
    ( on b356 b276 )
    ( clear b356 )
  )
  ( :goal
    ( and
      ( clear b617 )
    )
  )
)
