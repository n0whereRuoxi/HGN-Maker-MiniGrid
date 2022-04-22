( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b503 - block
    b632 - block
    b206 - block
    b384 - block
    b290 - block
    b966 - block
    b476 - block
    b973 - block
    b187 - block
    b108 - block
    b906 - block
    b217 - block
    b819 - block
    b438 - block
    b288 - block
    b810 - block
    b64 - block
    b346 - block
    b282 - block
    b656 - block
    b336 - block
    b521 - block
    b267 - block
    b178 - block
    b464 - block
    b364 - block
    b854 - block
    b38 - block
    b107 - block
    b82 - block
    b839 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b503 )
    ( on b632 b503 )
    ( on b206 b632 )
    ( on b384 b206 )
    ( on b290 b384 )
    ( on b966 b290 )
    ( on b476 b966 )
    ( on b973 b476 )
    ( on b187 b973 )
    ( on b108 b187 )
    ( on b906 b108 )
    ( on b217 b906 )
    ( on b819 b217 )
    ( on b438 b819 )
    ( on b288 b438 )
    ( on b810 b288 )
    ( on b64 b810 )
    ( on b346 b64 )
    ( on b282 b346 )
    ( on b656 b282 )
    ( on b336 b656 )
    ( on b521 b336 )
    ( on b267 b521 )
    ( on b178 b267 )
    ( on b464 b178 )
    ( on b364 b464 )
    ( on b854 b364 )
    ( on b38 b854 )
    ( on b107 b38 )
    ( on b82 b107 )
    ( on b839 b82 )
    ( clear b839 )
  )
  ( :goal
    ( and
      ( clear b503 )
    )
  )
)
