( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b715 - block
    b585 - block
    b882 - block
    b146 - block
    b226 - block
    b40 - block
    b480 - block
    b425 - block
    b263 - block
    b799 - block
    b946 - block
    b616 - block
    b367 - block
    b187 - block
    b460 - block
    b241 - block
    b466 - block
    b276 - block
    b807 - block
    b676 - block
    b572 - block
    b478 - block
    b681 - block
    b304 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b715 )
    ( on b585 b715 )
    ( on b882 b585 )
    ( on b146 b882 )
    ( on b226 b146 )
    ( on b40 b226 )
    ( on b480 b40 )
    ( on b425 b480 )
    ( on b263 b425 )
    ( on b799 b263 )
    ( on b946 b799 )
    ( on b616 b946 )
    ( on b367 b616 )
    ( on b187 b367 )
    ( on b460 b187 )
    ( on b241 b460 )
    ( on b466 b241 )
    ( on b276 b466 )
    ( on b807 b276 )
    ( on b676 b807 )
    ( on b572 b676 )
    ( on b478 b572 )
    ( on b681 b478 )
    ( on b304 b681 )
    ( clear b304 )
  )
  ( :goal
    ( and
      ( clear b715 )
    )
  )
)
