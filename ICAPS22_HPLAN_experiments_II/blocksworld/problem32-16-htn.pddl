( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b914 - block
    b927 - block
    b909 - block
    b423 - block
    b540 - block
    b499 - block
    b182 - block
    b460 - block
    b51 - block
    b303 - block
    b264 - block
    b920 - block
    b918 - block
    b471 - block
    b436 - block
    b781 - block
    b866 - block
    b206 - block
    b952 - block
    b797 - block
    b664 - block
    b127 - block
    b417 - block
    b926 - block
    b817 - block
    b644 - block
    b594 - block
    b295 - block
    b425 - block
    b429 - block
    b266 - block
    b549 - block
    b523 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b914 )
    ( on b927 b914 )
    ( on b909 b927 )
    ( on b423 b909 )
    ( on b540 b423 )
    ( on b499 b540 )
    ( on b182 b499 )
    ( on b460 b182 )
    ( on b51 b460 )
    ( on b303 b51 )
    ( on b264 b303 )
    ( on b920 b264 )
    ( on b918 b920 )
    ( on b471 b918 )
    ( on b436 b471 )
    ( on b781 b436 )
    ( on b866 b781 )
    ( on b206 b866 )
    ( on b952 b206 )
    ( on b797 b952 )
    ( on b664 b797 )
    ( on b127 b664 )
    ( on b417 b127 )
    ( on b926 b417 )
    ( on b817 b926 )
    ( on b644 b817 )
    ( on b594 b644 )
    ( on b295 b594 )
    ( on b425 b295 )
    ( on b429 b425 )
    ( on b266 b429 )
    ( on b549 b266 )
    ( on b523 b549 )
    ( clear b523 )
  )
  ( :tasks
    ( Make-32Pile b927 b909 b423 b540 b499 b182 b460 b51 b303 b264 b920 b918 b471 b436 b781 b866 b206 b952 b797 b664 b127 b417 b926 b817 b644 b594 b295 b425 b429 b266 b549 b523 )
  )
)
