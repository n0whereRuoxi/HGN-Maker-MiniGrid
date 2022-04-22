( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b649 - block
    b410 - block
    b993 - block
    b781 - block
    b984 - block
    b489 - block
    b718 - block
    b653 - block
    b155 - block
    b749 - block
    b188 - block
    b738 - block
    b399 - block
    b36 - block
    b146 - block
    b952 - block
    b213 - block
    b789 - block
    b732 - block
    b316 - block
    b755 - block
    b493 - block
    b20 - block
    b916 - block
    b999 - block
    b202 - block
    b697 - block
    b619 - block
    b979 - block
    b101 - block
    b340 - block
    b499 - block
    b297 - block
    b178 - block
    b844 - block
    b779 - block
    b650 - block
    b364 - block
    b453 - block
    b167 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b649 )
    ( on b410 b649 )
    ( on b993 b410 )
    ( on b781 b993 )
    ( on b984 b781 )
    ( on b489 b984 )
    ( on b718 b489 )
    ( on b653 b718 )
    ( on b155 b653 )
    ( on b749 b155 )
    ( on b188 b749 )
    ( on b738 b188 )
    ( on b399 b738 )
    ( on b36 b399 )
    ( on b146 b36 )
    ( on b952 b146 )
    ( on b213 b952 )
    ( on b789 b213 )
    ( on b732 b789 )
    ( on b316 b732 )
    ( on b755 b316 )
    ( on b493 b755 )
    ( on b20 b493 )
    ( on b916 b20 )
    ( on b999 b916 )
    ( on b202 b999 )
    ( on b697 b202 )
    ( on b619 b697 )
    ( on b979 b619 )
    ( on b101 b979 )
    ( on b340 b101 )
    ( on b499 b340 )
    ( on b297 b499 )
    ( on b178 b297 )
    ( on b844 b178 )
    ( on b779 b844 )
    ( on b650 b779 )
    ( on b364 b650 )
    ( on b453 b364 )
    ( on b167 b453 )
    ( clear b167 )
  )
  ( :goal
    ( and
      ( clear b649 )
    )
  )
)
