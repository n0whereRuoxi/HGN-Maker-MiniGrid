( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b430 - block
    b741 - block
    b522 - block
    b894 - block
    b208 - block
    b840 - block
    b86 - block
    b895 - block
    b188 - block
    b692 - block
    b269 - block
    b784 - block
    b346 - block
    b924 - block
    b723 - block
    b146 - block
    b999 - block
    b807 - block
    b225 - block
    b27 - block
    b881 - block
    b223 - block
    b292 - block
    b59 - block
    b775 - block
    b214 - block
    b576 - block
    b856 - block
    b518 - block
    b594 - block
    b275 - block
    b327 - block
    b966 - block
    b676 - block
    b37 - block
    b957 - block
    b41 - block
    b80 - block
    b609 - block
    b756 - block
    b111 - block
    b817 - block
    b81 - block
    b714 - block
    b483 - block
    b32 - block
    b864 - block
    b871 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b430 )
    ( on b741 b430 )
    ( on b522 b741 )
    ( on b894 b522 )
    ( on b208 b894 )
    ( on b840 b208 )
    ( on b86 b840 )
    ( on b895 b86 )
    ( on b188 b895 )
    ( on b692 b188 )
    ( on b269 b692 )
    ( on b784 b269 )
    ( on b346 b784 )
    ( on b924 b346 )
    ( on b723 b924 )
    ( on b146 b723 )
    ( on b999 b146 )
    ( on b807 b999 )
    ( on b225 b807 )
    ( on b27 b225 )
    ( on b881 b27 )
    ( on b223 b881 )
    ( on b292 b223 )
    ( on b59 b292 )
    ( on b775 b59 )
    ( on b214 b775 )
    ( on b576 b214 )
    ( on b856 b576 )
    ( on b518 b856 )
    ( on b594 b518 )
    ( on b275 b594 )
    ( on b327 b275 )
    ( on b966 b327 )
    ( on b676 b966 )
    ( on b37 b676 )
    ( on b957 b37 )
    ( on b41 b957 )
    ( on b80 b41 )
    ( on b609 b80 )
    ( on b756 b609 )
    ( on b111 b756 )
    ( on b817 b111 )
    ( on b81 b817 )
    ( on b714 b81 )
    ( on b483 b714 )
    ( on b32 b483 )
    ( on b864 b32 )
    ( on b871 b864 )
    ( clear b871 )
  )
  ( :goal
    ( and
      ( clear b430 )
    )
  )
)
