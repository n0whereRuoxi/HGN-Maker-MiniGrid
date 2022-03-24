( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b770 - block
    b185 - block
    b121 - block
    b689 - block
    b92 - block
    b478 - block
    b647 - block
    b506 - block
    b623 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b770 )
    ( on b185 b770 )
    ( on b121 b185 )
    ( on b689 b121 )
    ( on b92 b689 )
    ( on b478 b92 )
    ( on b647 b478 )
    ( on b506 b647 )
    ( on b623 b506 )
    ( clear b623 )
  )
  ( :goal
    ( and
      ( clear b770 )
    )
  )
)
