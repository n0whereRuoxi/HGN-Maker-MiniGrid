( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b365 - block
    b816 - block
    b720 - block
    b945 - block
    b770 - block
    b114 - block
    b594 - block
    b675 - block
    b72 - block
    b926 - block
    b389 - block
    b486 - block
    b714 - block
    b515 - block
    b161 - block
    b254 - block
    b155 - block
    b907 - block
    b60 - block
    b625 - block
    b303 - block
    b657 - block
    b701 - block
    b402 - block
    b458 - block
    b696 - block
    b169 - block
    b7 - block
    b188 - block
    b322 - block
    b797 - block
    b892 - block
    b506 - block
    b743 - block
    b47 - block
    b899 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b365 )
    ( on b816 b365 )
    ( on b720 b816 )
    ( on b945 b720 )
    ( on b770 b945 )
    ( on b114 b770 )
    ( on b594 b114 )
    ( on b675 b594 )
    ( on b72 b675 )
    ( on b926 b72 )
    ( on b389 b926 )
    ( on b486 b389 )
    ( on b714 b486 )
    ( on b515 b714 )
    ( on b161 b515 )
    ( on b254 b161 )
    ( on b155 b254 )
    ( on b907 b155 )
    ( on b60 b907 )
    ( on b625 b60 )
    ( on b303 b625 )
    ( on b657 b303 )
    ( on b701 b657 )
    ( on b402 b701 )
    ( on b458 b402 )
    ( on b696 b458 )
    ( on b169 b696 )
    ( on b7 b169 )
    ( on b188 b7 )
    ( on b322 b188 )
    ( on b797 b322 )
    ( on b892 b797 )
    ( on b506 b892 )
    ( on b743 b506 )
    ( on b47 b743 )
    ( on b899 b47 )
    ( clear b899 )
  )
  ( :tasks
    ( Make-35Pile b816 b720 b945 b770 b114 b594 b675 b72 b926 b389 b486 b714 b515 b161 b254 b155 b907 b60 b625 b303 b657 b701 b402 b458 b696 b169 b7 b188 b322 b797 b892 b506 b743 b47 b899 )
  )
)
