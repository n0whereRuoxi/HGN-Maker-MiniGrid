( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b77 - block
    b549 - block
    b928 - block
    b94 - block
    b998 - block
    b227 - block
    b688 - block
    b538 - block
    b729 - block
    b739 - block
    b962 - block
    b471 - block
    b385 - block
    b866 - block
    b375 - block
    b672 - block
    b512 - block
    b807 - block
    b491 - block
    b259 - block
    b831 - block
    b940 - block
    b536 - block
    b260 - block
    b397 - block
    b826 - block
    b996 - block
    b307 - block
    b522 - block
    b181 - block
    b908 - block
    b663 - block
    b116 - block
    b683 - block
    b441 - block
    b226 - block
    b416 - block
    b195 - block
    b564 - block
    b954 - block
    b598 - block
    b46 - block
    b199 - block
    b274 - block
    b764 - block
    b897 - block
    b615 - block
    b680 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b77 )
    ( on b549 b77 )
    ( on b928 b549 )
    ( on b94 b928 )
    ( on b998 b94 )
    ( on b227 b998 )
    ( on b688 b227 )
    ( on b538 b688 )
    ( on b729 b538 )
    ( on b739 b729 )
    ( on b962 b739 )
    ( on b471 b962 )
    ( on b385 b471 )
    ( on b866 b385 )
    ( on b375 b866 )
    ( on b672 b375 )
    ( on b512 b672 )
    ( on b807 b512 )
    ( on b491 b807 )
    ( on b259 b491 )
    ( on b831 b259 )
    ( on b940 b831 )
    ( on b536 b940 )
    ( on b260 b536 )
    ( on b397 b260 )
    ( on b826 b397 )
    ( on b996 b826 )
    ( on b307 b996 )
    ( on b522 b307 )
    ( on b181 b522 )
    ( on b908 b181 )
    ( on b663 b908 )
    ( on b116 b663 )
    ( on b683 b116 )
    ( on b441 b683 )
    ( on b226 b441 )
    ( on b416 b226 )
    ( on b195 b416 )
    ( on b564 b195 )
    ( on b954 b564 )
    ( on b598 b954 )
    ( on b46 b598 )
    ( on b199 b46 )
    ( on b274 b199 )
    ( on b764 b274 )
    ( on b897 b764 )
    ( on b615 b897 )
    ( on b680 b615 )
    ( clear b680 )
  )
  ( :goal
    ( and
      ( clear b77 )
    )
  )
)
