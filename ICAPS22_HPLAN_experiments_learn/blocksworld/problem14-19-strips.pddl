( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b849 - block
    b57 - block
    b359 - block
    b611 - block
    b165 - block
    b315 - block
    b550 - block
    b795 - block
    b132 - block
    b199 - block
    b987 - block
    b444 - block
    b102 - block
    b202 - block
    b592 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b849 )
    ( on b57 b849 )
    ( on b359 b57 )
    ( on b611 b359 )
    ( on b165 b611 )
    ( on b315 b165 )
    ( on b550 b315 )
    ( on b795 b550 )
    ( on b132 b795 )
    ( on b199 b132 )
    ( on b987 b199 )
    ( on b444 b987 )
    ( on b102 b444 )
    ( on b202 b102 )
    ( on b592 b202 )
    ( clear b592 )
  )
  ( :goal
    ( and
      ( clear b849 )
    )
  )
)
