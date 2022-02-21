( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b839 - block
    b85 - block
    b589 - block
    b32 - block
    b67 - block
    b328 - block
    b415 - block
    b497 - block
    b213 - block
    b237 - block
    b402 - block
    b916 - block
    b569 - block
    b735 - block
    b625 - block
    b850 - block
    b269 - block
    b376 - block
    b75 - block
    b173 - block
    b314 - block
    b945 - block
    b227 - block
    b331 - block
    b980 - block
    b737 - block
    b512 - block
    b639 - block
    b820 - block
    b357 - block
    b669 - block
    b231 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b839 )
    ( on b85 b839 )
    ( on b589 b85 )
    ( on b32 b589 )
    ( on b67 b32 )
    ( on b328 b67 )
    ( on b415 b328 )
    ( on b497 b415 )
    ( on b213 b497 )
    ( on b237 b213 )
    ( on b402 b237 )
    ( on b916 b402 )
    ( on b569 b916 )
    ( on b735 b569 )
    ( on b625 b735 )
    ( on b850 b625 )
    ( on b269 b850 )
    ( on b376 b269 )
    ( on b75 b376 )
    ( on b173 b75 )
    ( on b314 b173 )
    ( on b945 b314 )
    ( on b227 b945 )
    ( on b331 b227 )
    ( on b980 b331 )
    ( on b737 b980 )
    ( on b512 b737 )
    ( on b639 b512 )
    ( on b820 b639 )
    ( on b357 b820 )
    ( on b669 b357 )
    ( on b231 b669 )
    ( clear b231 )
  )
  ( :goal
    ( and
      ( clear b839 )
    )
  )
)
