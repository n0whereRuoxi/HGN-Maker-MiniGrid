( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b612 - block
    b825 - block
    b960 - block
    b316 - block
    b410 - block
    b770 - block
    b526 - block
    b67 - block
    b951 - block
    b480 - block
    b66 - block
    b86 - block
    b980 - block
    b707 - block
    b482 - block
    b973 - block
    b705 - block
    b605 - block
    b702 - block
    b652 - block
    b563 - block
    b15 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b612 )
    ( on b825 b612 )
    ( on b960 b825 )
    ( on b316 b960 )
    ( on b410 b316 )
    ( on b770 b410 )
    ( on b526 b770 )
    ( on b67 b526 )
    ( on b951 b67 )
    ( on b480 b951 )
    ( on b66 b480 )
    ( on b86 b66 )
    ( on b980 b86 )
    ( on b707 b980 )
    ( on b482 b707 )
    ( on b973 b482 )
    ( on b705 b973 )
    ( on b605 b705 )
    ( on b702 b605 )
    ( on b652 b702 )
    ( on b563 b652 )
    ( on b15 b563 )
    ( clear b15 )
  )
  ( :tasks
    ( Make-21Pile b825 b960 b316 b410 b770 b526 b67 b951 b480 b66 b86 b980 b707 b482 b973 b705 b605 b702 b652 b563 b15 )
  )
)
