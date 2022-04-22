( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b140 - block
    b704 - block
    b707 - block
    b615 - block
    b328 - block
    b226 - block
    b465 - block
    b989 - block
    b789 - block
    b133 - block
    b794 - block
    b748 - block
    b130 - block
    b286 - block
    b509 - block
    b913 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b140 )
    ( on b704 b140 )
    ( on b707 b704 )
    ( on b615 b707 )
    ( on b328 b615 )
    ( on b226 b328 )
    ( on b465 b226 )
    ( on b989 b465 )
    ( on b789 b989 )
    ( on b133 b789 )
    ( on b794 b133 )
    ( on b748 b794 )
    ( on b130 b748 )
    ( on b286 b130 )
    ( on b509 b286 )
    ( on b913 b509 )
    ( clear b913 )
  )
  ( :goal
    ( and
      ( clear b140 )
    )
  )
)
