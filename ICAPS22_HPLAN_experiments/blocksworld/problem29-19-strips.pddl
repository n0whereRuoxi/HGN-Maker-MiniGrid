( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b156 - block
    b827 - block
    b594 - block
    b119 - block
    b259 - block
    b257 - block
    b998 - block
    b699 - block
    b564 - block
    b90 - block
    b17 - block
    b471 - block
    b128 - block
    b286 - block
    b696 - block
    b557 - block
    b901 - block
    b213 - block
    b138 - block
    b230 - block
    b281 - block
    b473 - block
    b178 - block
    b512 - block
    b136 - block
    b446 - block
    b143 - block
    b938 - block
    b819 - block
    b416 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b156 )
    ( on b827 b156 )
    ( on b594 b827 )
    ( on b119 b594 )
    ( on b259 b119 )
    ( on b257 b259 )
    ( on b998 b257 )
    ( on b699 b998 )
    ( on b564 b699 )
    ( on b90 b564 )
    ( on b17 b90 )
    ( on b471 b17 )
    ( on b128 b471 )
    ( on b286 b128 )
    ( on b696 b286 )
    ( on b557 b696 )
    ( on b901 b557 )
    ( on b213 b901 )
    ( on b138 b213 )
    ( on b230 b138 )
    ( on b281 b230 )
    ( on b473 b281 )
    ( on b178 b473 )
    ( on b512 b178 )
    ( on b136 b512 )
    ( on b446 b136 )
    ( on b143 b446 )
    ( on b938 b143 )
    ( on b819 b938 )
    ( on b416 b819 )
    ( clear b416 )
  )
  ( :goal
    ( and
      ( clear b156 )
    )
  )
)
