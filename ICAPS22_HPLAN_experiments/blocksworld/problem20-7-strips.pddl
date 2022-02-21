( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b925 - block
    b814 - block
    b863 - block
    b64 - block
    b649 - block
    b815 - block
    b80 - block
    b274 - block
    b865 - block
    b608 - block
    b140 - block
    b881 - block
    b572 - block
    b647 - block
    b135 - block
    b676 - block
    b399 - block
    b9 - block
    b542 - block
    b778 - block
    b447 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b925 )
    ( on b814 b925 )
    ( on b863 b814 )
    ( on b64 b863 )
    ( on b649 b64 )
    ( on b815 b649 )
    ( on b80 b815 )
    ( on b274 b80 )
    ( on b865 b274 )
    ( on b608 b865 )
    ( on b140 b608 )
    ( on b881 b140 )
    ( on b572 b881 )
    ( on b647 b572 )
    ( on b135 b647 )
    ( on b676 b135 )
    ( on b399 b676 )
    ( on b9 b399 )
    ( on b542 b9 )
    ( on b778 b542 )
    ( on b447 b778 )
    ( clear b447 )
  )
  ( :goal
    ( and
      ( clear b925 )
    )
  )
)
