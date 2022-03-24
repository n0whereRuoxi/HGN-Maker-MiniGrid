( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b152 - block
    b873 - block
    b766 - block
    b80 - block
    b993 - block
    b97 - block
    b627 - block
    b705 - block
    b126 - block
    b2 - block
    b714 - block
    b259 - block
    b676 - block
    b532 - block
    b778 - block
    b211 - block
    b220 - block
    b271 - block
    b903 - block
    b423 - block
    b213 - block
    b327 - block
    b812 - block
    b888 - block
    b279 - block
    b549 - block
    b324 - block
    b834 - block
    b641 - block
    b5 - block
    b284 - block
    b624 - block
    b319 - block
    b728 - block
    b916 - block
    b389 - block
    b488 - block
    b500 - block
    b837 - block
    b134 - block
    b857 - block
    b436 - block
    b940 - block
    b302 - block
    b479 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b152 )
    ( on b873 b152 )
    ( on b766 b873 )
    ( on b80 b766 )
    ( on b993 b80 )
    ( on b97 b993 )
    ( on b627 b97 )
    ( on b705 b627 )
    ( on b126 b705 )
    ( on b2 b126 )
    ( on b714 b2 )
    ( on b259 b714 )
    ( on b676 b259 )
    ( on b532 b676 )
    ( on b778 b532 )
    ( on b211 b778 )
    ( on b220 b211 )
    ( on b271 b220 )
    ( on b903 b271 )
    ( on b423 b903 )
    ( on b213 b423 )
    ( on b327 b213 )
    ( on b812 b327 )
    ( on b888 b812 )
    ( on b279 b888 )
    ( on b549 b279 )
    ( on b324 b549 )
    ( on b834 b324 )
    ( on b641 b834 )
    ( on b5 b641 )
    ( on b284 b5 )
    ( on b624 b284 )
    ( on b319 b624 )
    ( on b728 b319 )
    ( on b916 b728 )
    ( on b389 b916 )
    ( on b488 b389 )
    ( on b500 b488 )
    ( on b837 b500 )
    ( on b134 b837 )
    ( on b857 b134 )
    ( on b436 b857 )
    ( on b940 b436 )
    ( on b302 b940 )
    ( on b479 b302 )
    ( clear b479 )
  )
  ( :tasks
    ( Make-44Pile b873 b766 b80 b993 b97 b627 b705 b126 b2 b714 b259 b676 b532 b778 b211 b220 b271 b903 b423 b213 b327 b812 b888 b279 b549 b324 b834 b641 b5 b284 b624 b319 b728 b916 b389 b488 b500 b837 b134 b857 b436 b940 b302 b479 )
  )
)
