( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b334 - block
    b982 - block
    b310 - block
    b583 - block
    b790 - block
    b548 - block
    b635 - block
    b76 - block
    b125 - block
    b273 - block
    b988 - block
    b196 - block
    b499 - block
    b293 - block
    b578 - block
    b496 - block
    b426 - block
    b981 - block
    b337 - block
    b27 - block
    b51 - block
    b716 - block
    b823 - block
    b641 - block
    b643 - block
    b199 - block
    b111 - block
    b323 - block
    b686 - block
    b963 - block
    b303 - block
    b178 - block
    b803 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b334 )
    ( on b982 b334 )
    ( on b310 b982 )
    ( on b583 b310 )
    ( on b790 b583 )
    ( on b548 b790 )
    ( on b635 b548 )
    ( on b76 b635 )
    ( on b125 b76 )
    ( on b273 b125 )
    ( on b988 b273 )
    ( on b196 b988 )
    ( on b499 b196 )
    ( on b293 b499 )
    ( on b578 b293 )
    ( on b496 b578 )
    ( on b426 b496 )
    ( on b981 b426 )
    ( on b337 b981 )
    ( on b27 b337 )
    ( on b51 b27 )
    ( on b716 b51 )
    ( on b823 b716 )
    ( on b641 b823 )
    ( on b643 b641 )
    ( on b199 b643 )
    ( on b111 b199 )
    ( on b323 b111 )
    ( on b686 b323 )
    ( on b963 b686 )
    ( on b303 b963 )
    ( on b178 b303 )
    ( on b803 b178 )
    ( clear b803 )
  )
  ( :goal
    ( and
      ( clear b334 )
    )
  )
)
