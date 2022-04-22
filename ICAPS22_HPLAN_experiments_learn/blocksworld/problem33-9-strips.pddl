( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b446 - block
    b428 - block
    b155 - block
    b69 - block
    b15 - block
    b778 - block
    b207 - block
    b933 - block
    b167 - block
    b362 - block
    b107 - block
    b645 - block
    b925 - block
    b292 - block
    b643 - block
    b731 - block
    b418 - block
    b359 - block
    b447 - block
    b123 - block
    b521 - block
    b438 - block
    b498 - block
    b937 - block
    b758 - block
    b771 - block
    b847 - block
    b312 - block
    b352 - block
    b891 - block
    b721 - block
    b558 - block
    b858 - block
    b493 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b446 )
    ( on b428 b446 )
    ( on b155 b428 )
    ( on b69 b155 )
    ( on b15 b69 )
    ( on b778 b15 )
    ( on b207 b778 )
    ( on b933 b207 )
    ( on b167 b933 )
    ( on b362 b167 )
    ( on b107 b362 )
    ( on b645 b107 )
    ( on b925 b645 )
    ( on b292 b925 )
    ( on b643 b292 )
    ( on b731 b643 )
    ( on b418 b731 )
    ( on b359 b418 )
    ( on b447 b359 )
    ( on b123 b447 )
    ( on b521 b123 )
    ( on b438 b521 )
    ( on b498 b438 )
    ( on b937 b498 )
    ( on b758 b937 )
    ( on b771 b758 )
    ( on b847 b771 )
    ( on b312 b847 )
    ( on b352 b312 )
    ( on b891 b352 )
    ( on b721 b891 )
    ( on b558 b721 )
    ( on b858 b558 )
    ( on b493 b858 )
    ( clear b493 )
  )
  ( :goal
    ( and
      ( clear b446 )
    )
  )
)
