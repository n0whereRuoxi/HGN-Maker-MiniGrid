( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b740 - block
    b667 - block
    b696 - block
    b641 - block
    b176 - block
    b809 - block
    b495 - block
    b988 - block
    b999 - block
    b86 - block
    b172 - block
    b174 - block
    b992 - block
    b600 - block
    b230 - block
    b759 - block
    b407 - block
    b995 - block
    b822 - block
    b770 - block
    b536 - block
    b47 - block
    b101 - block
    b361 - block
    b285 - block
    b452 - block
    b816 - block
    b566 - block
    b592 - block
    b191 - block
    b545 - block
    b335 - block
    b68 - block
    b699 - block
    b144 - block
    b831 - block
    b833 - block
    b747 - block
    b836 - block
    b470 - block
    b401 - block
    b852 - block
    b425 - block
    b900 - block
    b414 - block
    b2 - block
    b938 - block
    b18 - block
    b640 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b740 )
    ( on b667 b740 )
    ( on b696 b667 )
    ( on b641 b696 )
    ( on b176 b641 )
    ( on b809 b176 )
    ( on b495 b809 )
    ( on b988 b495 )
    ( on b999 b988 )
    ( on b86 b999 )
    ( on b172 b86 )
    ( on b174 b172 )
    ( on b992 b174 )
    ( on b600 b992 )
    ( on b230 b600 )
    ( on b759 b230 )
    ( on b407 b759 )
    ( on b995 b407 )
    ( on b822 b995 )
    ( on b770 b822 )
    ( on b536 b770 )
    ( on b47 b536 )
    ( on b101 b47 )
    ( on b361 b101 )
    ( on b285 b361 )
    ( on b452 b285 )
    ( on b816 b452 )
    ( on b566 b816 )
    ( on b592 b566 )
    ( on b191 b592 )
    ( on b545 b191 )
    ( on b335 b545 )
    ( on b68 b335 )
    ( on b699 b68 )
    ( on b144 b699 )
    ( on b831 b144 )
    ( on b833 b831 )
    ( on b747 b833 )
    ( on b836 b747 )
    ( on b470 b836 )
    ( on b401 b470 )
    ( on b852 b401 )
    ( on b425 b852 )
    ( on b900 b425 )
    ( on b414 b900 )
    ( on b2 b414 )
    ( on b938 b2 )
    ( on b18 b938 )
    ( on b640 b18 )
    ( clear b640 )
  )
  ( :goal
    ( and
      ( clear b740 )
    )
  )
)
