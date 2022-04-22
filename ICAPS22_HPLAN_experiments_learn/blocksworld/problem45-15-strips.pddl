( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b654 - block
    b171 - block
    b665 - block
    b951 - block
    b429 - block
    b422 - block
    b751 - block
    b214 - block
    b65 - block
    b237 - block
    b549 - block
    b634 - block
    b977 - block
    b326 - block
    b600 - block
    b606 - block
    b33 - block
    b591 - block
    b95 - block
    b513 - block
    b590 - block
    b98 - block
    b165 - block
    b526 - block
    b909 - block
    b793 - block
    b836 - block
    b131 - block
    b60 - block
    b677 - block
    b302 - block
    b673 - block
    b375 - block
    b392 - block
    b884 - block
    b657 - block
    b746 - block
    b202 - block
    b953 - block
    b572 - block
    b253 - block
    b22 - block
    b440 - block
    b902 - block
    b716 - block
    b776 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b654 )
    ( on b171 b654 )
    ( on b665 b171 )
    ( on b951 b665 )
    ( on b429 b951 )
    ( on b422 b429 )
    ( on b751 b422 )
    ( on b214 b751 )
    ( on b65 b214 )
    ( on b237 b65 )
    ( on b549 b237 )
    ( on b634 b549 )
    ( on b977 b634 )
    ( on b326 b977 )
    ( on b600 b326 )
    ( on b606 b600 )
    ( on b33 b606 )
    ( on b591 b33 )
    ( on b95 b591 )
    ( on b513 b95 )
    ( on b590 b513 )
    ( on b98 b590 )
    ( on b165 b98 )
    ( on b526 b165 )
    ( on b909 b526 )
    ( on b793 b909 )
    ( on b836 b793 )
    ( on b131 b836 )
    ( on b60 b131 )
    ( on b677 b60 )
    ( on b302 b677 )
    ( on b673 b302 )
    ( on b375 b673 )
    ( on b392 b375 )
    ( on b884 b392 )
    ( on b657 b884 )
    ( on b746 b657 )
    ( on b202 b746 )
    ( on b953 b202 )
    ( on b572 b953 )
    ( on b253 b572 )
    ( on b22 b253 )
    ( on b440 b22 )
    ( on b902 b440 )
    ( on b716 b902 )
    ( on b776 b716 )
    ( clear b776 )
  )
  ( :goal
    ( and
      ( clear b654 )
    )
  )
)
