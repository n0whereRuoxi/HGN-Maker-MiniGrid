( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b601 - block
    b369 - block
    b760 - block
    b128 - block
    b40 - block
    b827 - block
    b168 - block
    b655 - block
    b967 - block
    b187 - block
    b365 - block
    b540 - block
    b401 - block
    b590 - block
    b623 - block
    b957 - block
    b314 - block
    b737 - block
    b342 - block
    b10 - block
    b353 - block
    b211 - block
    b271 - block
    b648 - block
    b96 - block
    b242 - block
    b392 - block
    b438 - block
    b496 - block
    b786 - block
    b925 - block
    b580 - block
    b319 - block
    b776 - block
    b931 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b601 )
    ( on b369 b601 )
    ( on b760 b369 )
    ( on b128 b760 )
    ( on b40 b128 )
    ( on b827 b40 )
    ( on b168 b827 )
    ( on b655 b168 )
    ( on b967 b655 )
    ( on b187 b967 )
    ( on b365 b187 )
    ( on b540 b365 )
    ( on b401 b540 )
    ( on b590 b401 )
    ( on b623 b590 )
    ( on b957 b623 )
    ( on b314 b957 )
    ( on b737 b314 )
    ( on b342 b737 )
    ( on b10 b342 )
    ( on b353 b10 )
    ( on b211 b353 )
    ( on b271 b211 )
    ( on b648 b271 )
    ( on b96 b648 )
    ( on b242 b96 )
    ( on b392 b242 )
    ( on b438 b392 )
    ( on b496 b438 )
    ( on b786 b496 )
    ( on b925 b786 )
    ( on b580 b925 )
    ( on b319 b580 )
    ( on b776 b319 )
    ( on b931 b776 )
    ( clear b931 )
  )
  ( :goal
    ( and
      ( clear b601 )
    )
  )
)
