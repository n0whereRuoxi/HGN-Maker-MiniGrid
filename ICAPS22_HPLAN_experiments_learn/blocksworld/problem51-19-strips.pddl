( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b267 - block
    b711 - block
    b341 - block
    b245 - block
    b892 - block
    b645 - block
    b522 - block
    b611 - block
    b847 - block
    b684 - block
    b959 - block
    b58 - block
    b773 - block
    b317 - block
    b395 - block
    b762 - block
    b654 - block
    b673 - block
    b52 - block
    b592 - block
    b612 - block
    b460 - block
    b112 - block
    b406 - block
    b106 - block
    b47 - block
    b712 - block
    b93 - block
    b990 - block
    b436 - block
    b138 - block
    b958 - block
    b899 - block
    b951 - block
    b480 - block
    b676 - block
    b119 - block
    b54 - block
    b163 - block
    b823 - block
    b887 - block
    b170 - block
    b722 - block
    b671 - block
    b66 - block
    b333 - block
    b746 - block
    b278 - block
    b679 - block
    b179 - block
    b461 - block
    b564 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b267 )
    ( on b711 b267 )
    ( on b341 b711 )
    ( on b245 b341 )
    ( on b892 b245 )
    ( on b645 b892 )
    ( on b522 b645 )
    ( on b611 b522 )
    ( on b847 b611 )
    ( on b684 b847 )
    ( on b959 b684 )
    ( on b58 b959 )
    ( on b773 b58 )
    ( on b317 b773 )
    ( on b395 b317 )
    ( on b762 b395 )
    ( on b654 b762 )
    ( on b673 b654 )
    ( on b52 b673 )
    ( on b592 b52 )
    ( on b612 b592 )
    ( on b460 b612 )
    ( on b112 b460 )
    ( on b406 b112 )
    ( on b106 b406 )
    ( on b47 b106 )
    ( on b712 b47 )
    ( on b93 b712 )
    ( on b990 b93 )
    ( on b436 b990 )
    ( on b138 b436 )
    ( on b958 b138 )
    ( on b899 b958 )
    ( on b951 b899 )
    ( on b480 b951 )
    ( on b676 b480 )
    ( on b119 b676 )
    ( on b54 b119 )
    ( on b163 b54 )
    ( on b823 b163 )
    ( on b887 b823 )
    ( on b170 b887 )
    ( on b722 b170 )
    ( on b671 b722 )
    ( on b66 b671 )
    ( on b333 b66 )
    ( on b746 b333 )
    ( on b278 b746 )
    ( on b679 b278 )
    ( on b179 b679 )
    ( on b461 b179 )
    ( on b564 b461 )
    ( clear b564 )
  )
  ( :goal
    ( and
      ( clear b267 )
    )
  )
)
