( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b748 - block
    b547 - block
    b40 - block
    b253 - block
    b600 - block
    b596 - block
    b861 - block
    b626 - block
    b802 - block
    b542 - block
    b365 - block
    b61 - block
    b984 - block
    b791 - block
    b13 - block
    b905 - block
    b565 - block
    b37 - block
    b951 - block
    b971 - block
    b64 - block
    b322 - block
    b2 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b748 )
    ( on b547 b748 )
    ( on b40 b547 )
    ( on b253 b40 )
    ( on b600 b253 )
    ( on b596 b600 )
    ( on b861 b596 )
    ( on b626 b861 )
    ( on b802 b626 )
    ( on b542 b802 )
    ( on b365 b542 )
    ( on b61 b365 )
    ( on b984 b61 )
    ( on b791 b984 )
    ( on b13 b791 )
    ( on b905 b13 )
    ( on b565 b905 )
    ( on b37 b565 )
    ( on b951 b37 )
    ( on b971 b951 )
    ( on b64 b971 )
    ( on b322 b64 )
    ( on b2 b322 )
    ( clear b2 )
  )
  ( :goal
    ( and
      ( clear b748 )
    )
  )
)
