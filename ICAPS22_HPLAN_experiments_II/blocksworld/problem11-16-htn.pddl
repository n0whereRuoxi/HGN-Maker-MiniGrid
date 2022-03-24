( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b559 - block
    b90 - block
    b432 - block
    b17 - block
    b141 - block
    b621 - block
    b340 - block
    b855 - block
    b528 - block
    b976 - block
    b157 - block
    b923 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b559 )
    ( on b90 b559 )
    ( on b432 b90 )
    ( on b17 b432 )
    ( on b141 b17 )
    ( on b621 b141 )
    ( on b340 b621 )
    ( on b855 b340 )
    ( on b528 b855 )
    ( on b976 b528 )
    ( on b157 b976 )
    ( on b923 b157 )
    ( clear b923 )
  )
  ( :tasks
    ( Make-11Pile b90 b432 b17 b141 b621 b340 b855 b528 b976 b157 b923 )
  )
)
