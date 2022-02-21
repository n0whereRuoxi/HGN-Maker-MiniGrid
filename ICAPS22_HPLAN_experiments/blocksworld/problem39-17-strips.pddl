( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b473 - block
    b460 - block
    b521 - block
    b212 - block
    b310 - block
    b757 - block
    b7 - block
    b810 - block
    b397 - block
    b153 - block
    b531 - block
    b958 - block
    b771 - block
    b538 - block
    b659 - block
    b173 - block
    b953 - block
    b198 - block
    b781 - block
    b110 - block
    b378 - block
    b348 - block
    b906 - block
    b419 - block
    b543 - block
    b121 - block
    b441 - block
    b596 - block
    b469 - block
    b519 - block
    b28 - block
    b179 - block
    b684 - block
    b676 - block
    b376 - block
    b300 - block
    b937 - block
    b51 - block
    b559 - block
    b341 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b473 )
    ( on b460 b473 )
    ( on b521 b460 )
    ( on b212 b521 )
    ( on b310 b212 )
    ( on b757 b310 )
    ( on b7 b757 )
    ( on b810 b7 )
    ( on b397 b810 )
    ( on b153 b397 )
    ( on b531 b153 )
    ( on b958 b531 )
    ( on b771 b958 )
    ( on b538 b771 )
    ( on b659 b538 )
    ( on b173 b659 )
    ( on b953 b173 )
    ( on b198 b953 )
    ( on b781 b198 )
    ( on b110 b781 )
    ( on b378 b110 )
    ( on b348 b378 )
    ( on b906 b348 )
    ( on b419 b906 )
    ( on b543 b419 )
    ( on b121 b543 )
    ( on b441 b121 )
    ( on b596 b441 )
    ( on b469 b596 )
    ( on b519 b469 )
    ( on b28 b519 )
    ( on b179 b28 )
    ( on b684 b179 )
    ( on b676 b684 )
    ( on b376 b676 )
    ( on b300 b376 )
    ( on b937 b300 )
    ( on b51 b937 )
    ( on b559 b51 )
    ( on b341 b559 )
    ( clear b341 )
  )
  ( :goal
    ( and
      ( clear b473 )
    )
  )
)
