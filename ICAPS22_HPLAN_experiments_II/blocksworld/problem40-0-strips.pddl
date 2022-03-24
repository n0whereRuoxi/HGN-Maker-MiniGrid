( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b697 - block
    b962 - block
    b601 - block
    b713 - block
    b199 - block
    b661 - block
    b106 - block
    b947 - block
    b123 - block
    b663 - block
    b936 - block
    b740 - block
    b239 - block
    b37 - block
    b758 - block
    b963 - block
    b545 - block
    b5 - block
    b396 - block
    b9 - block
    b467 - block
    b538 - block
    b436 - block
    b78 - block
    b715 - block
    b769 - block
    b121 - block
    b547 - block
    b488 - block
    b699 - block
    b718 - block
    b317 - block
    b495 - block
    b75 - block
    b536 - block
    b414 - block
    b504 - block
    b181 - block
    b789 - block
    b850 - block
    b524 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b697 )
    ( on b962 b697 )
    ( on b601 b962 )
    ( on b713 b601 )
    ( on b199 b713 )
    ( on b661 b199 )
    ( on b106 b661 )
    ( on b947 b106 )
    ( on b123 b947 )
    ( on b663 b123 )
    ( on b936 b663 )
    ( on b740 b936 )
    ( on b239 b740 )
    ( on b37 b239 )
    ( on b758 b37 )
    ( on b963 b758 )
    ( on b545 b963 )
    ( on b5 b545 )
    ( on b396 b5 )
    ( on b9 b396 )
    ( on b467 b9 )
    ( on b538 b467 )
    ( on b436 b538 )
    ( on b78 b436 )
    ( on b715 b78 )
    ( on b769 b715 )
    ( on b121 b769 )
    ( on b547 b121 )
    ( on b488 b547 )
    ( on b699 b488 )
    ( on b718 b699 )
    ( on b317 b718 )
    ( on b495 b317 )
    ( on b75 b495 )
    ( on b536 b75 )
    ( on b414 b536 )
    ( on b504 b414 )
    ( on b181 b504 )
    ( on b789 b181 )
    ( on b850 b789 )
    ( on b524 b850 )
    ( clear b524 )
  )
  ( :goal
    ( and
      ( clear b697 )
    )
  )
)
