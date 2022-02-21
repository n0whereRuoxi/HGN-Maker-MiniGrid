( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b887 - block
    b372 - block
    b307 - block
    b992 - block
    b451 - block
    b112 - block
    b511 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b887 )
    ( on b372 b887 )
    ( on b307 b372 )
    ( on b992 b307 )
    ( on b451 b992 )
    ( on b112 b451 )
    ( on b511 b112 )
    ( clear b511 )
  )
  ( :goal
    ( and
      ( clear b887 )
    )
  )
)
