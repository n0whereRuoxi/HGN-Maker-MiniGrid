( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b902 - block
    b525 - block
    b747 - block
    b542 - block
    b479 - block
    b633 - block
    b878 - block
    b235 - block
    b409 - block
    b538 - block
    b814 - block
    b665 - block
    b170 - block
    b134 - block
    b487 - block
    b307 - block
    b326 - block
    b213 - block
    b71 - block
    b440 - block
    b163 - block
    b789 - block
    b952 - block
    b768 - block
    b200 - block
    b933 - block
    b794 - block
    b691 - block
    b845 - block
    b646 - block
    b128 - block
    b484 - block
    b918 - block
    b482 - block
    b351 - block
    b601 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b902 )
    ( on b525 b902 )
    ( on b747 b525 )
    ( on b542 b747 )
    ( on b479 b542 )
    ( on b633 b479 )
    ( on b878 b633 )
    ( on b235 b878 )
    ( on b409 b235 )
    ( on b538 b409 )
    ( on b814 b538 )
    ( on b665 b814 )
    ( on b170 b665 )
    ( on b134 b170 )
    ( on b487 b134 )
    ( on b307 b487 )
    ( on b326 b307 )
    ( on b213 b326 )
    ( on b71 b213 )
    ( on b440 b71 )
    ( on b163 b440 )
    ( on b789 b163 )
    ( on b952 b789 )
    ( on b768 b952 )
    ( on b200 b768 )
    ( on b933 b200 )
    ( on b794 b933 )
    ( on b691 b794 )
    ( on b845 b691 )
    ( on b646 b845 )
    ( on b128 b646 )
    ( on b484 b128 )
    ( on b918 b484 )
    ( on b482 b918 )
    ( on b351 b482 )
    ( on b601 b351 )
    ( clear b601 )
  )
  ( :tasks
    ( Make-35Pile b525 b747 b542 b479 b633 b878 b235 b409 b538 b814 b665 b170 b134 b487 b307 b326 b213 b71 b440 b163 b789 b952 b768 b200 b933 b794 b691 b845 b646 b128 b484 b918 b482 b351 b601 )
  )
)
