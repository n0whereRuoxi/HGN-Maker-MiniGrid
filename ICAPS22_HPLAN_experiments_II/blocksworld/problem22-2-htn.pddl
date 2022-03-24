( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b663 - block
    b117 - block
    b321 - block
    b586 - block
    b438 - block
    b735 - block
    b297 - block
    b115 - block
    b924 - block
    b284 - block
    b805 - block
    b279 - block
    b607 - block
    b74 - block
    b744 - block
    b941 - block
    b666 - block
    b693 - block
    b851 - block
    b443 - block
    b306 - block
    b903 - block
    b268 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b663 )
    ( on b117 b663 )
    ( on b321 b117 )
    ( on b586 b321 )
    ( on b438 b586 )
    ( on b735 b438 )
    ( on b297 b735 )
    ( on b115 b297 )
    ( on b924 b115 )
    ( on b284 b924 )
    ( on b805 b284 )
    ( on b279 b805 )
    ( on b607 b279 )
    ( on b74 b607 )
    ( on b744 b74 )
    ( on b941 b744 )
    ( on b666 b941 )
    ( on b693 b666 )
    ( on b851 b693 )
    ( on b443 b851 )
    ( on b306 b443 )
    ( on b903 b306 )
    ( on b268 b903 )
    ( clear b268 )
  )
  ( :tasks
    ( Make-22Pile b117 b321 b586 b438 b735 b297 b115 b924 b284 b805 b279 b607 b74 b744 b941 b666 b693 b851 b443 b306 b903 b268 )
  )
)
