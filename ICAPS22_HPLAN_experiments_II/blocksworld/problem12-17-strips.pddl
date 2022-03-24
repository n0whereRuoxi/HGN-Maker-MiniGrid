( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b499 - block
    b7 - block
    b870 - block
    b607 - block
    b807 - block
    b191 - block
    b613 - block
    b48 - block
    b359 - block
    b514 - block
    b306 - block
    b317 - block
    b79 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b499 )
    ( on b7 b499 )
    ( on b870 b7 )
    ( on b607 b870 )
    ( on b807 b607 )
    ( on b191 b807 )
    ( on b613 b191 )
    ( on b48 b613 )
    ( on b359 b48 )
    ( on b514 b359 )
    ( on b306 b514 )
    ( on b317 b306 )
    ( on b79 b317 )
    ( clear b79 )
  )
  ( :goal
    ( and
      ( clear b499 )
    )
  )
)
