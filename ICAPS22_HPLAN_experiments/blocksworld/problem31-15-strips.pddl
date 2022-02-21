( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b753 - block
    b266 - block
    b528 - block
    b351 - block
    b129 - block
    b780 - block
    b761 - block
    b499 - block
    b778 - block
    b308 - block
    b70 - block
    b305 - block
    b271 - block
    b426 - block
    b657 - block
    b458 - block
    b735 - block
    b282 - block
    b487 - block
    b341 - block
    b850 - block
    b228 - block
    b263 - block
    b918 - block
    b342 - block
    b396 - block
    b855 - block
    b534 - block
    b95 - block
    b387 - block
    b505 - block
    b696 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b753 )
    ( on b266 b753 )
    ( on b528 b266 )
    ( on b351 b528 )
    ( on b129 b351 )
    ( on b780 b129 )
    ( on b761 b780 )
    ( on b499 b761 )
    ( on b778 b499 )
    ( on b308 b778 )
    ( on b70 b308 )
    ( on b305 b70 )
    ( on b271 b305 )
    ( on b426 b271 )
    ( on b657 b426 )
    ( on b458 b657 )
    ( on b735 b458 )
    ( on b282 b735 )
    ( on b487 b282 )
    ( on b341 b487 )
    ( on b850 b341 )
    ( on b228 b850 )
    ( on b263 b228 )
    ( on b918 b263 )
    ( on b342 b918 )
    ( on b396 b342 )
    ( on b855 b396 )
    ( on b534 b855 )
    ( on b95 b534 )
    ( on b387 b95 )
    ( on b505 b387 )
    ( on b696 b505 )
    ( clear b696 )
  )
  ( :goal
    ( and
      ( clear b753 )
    )
  )
)
