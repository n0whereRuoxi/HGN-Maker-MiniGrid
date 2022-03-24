( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b188 - block
    b951 - block
    b455 - block
    b577 - block
    b234 - block
    b12 - block
    b356 - block
    b739 - block
    b195 - block
    b572 - block
    b717 - block
    b981 - block
    b440 - block
    b459 - block
    b166 - block
    b531 - block
    b156 - block
    b765 - block
    b596 - block
    b880 - block
    b152 - block
    b816 - block
    b855 - block
    b357 - block
    b659 - block
    b818 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b188 )
    ( on b951 b188 )
    ( on b455 b951 )
    ( on b577 b455 )
    ( on b234 b577 )
    ( on b12 b234 )
    ( on b356 b12 )
    ( on b739 b356 )
    ( on b195 b739 )
    ( on b572 b195 )
    ( on b717 b572 )
    ( on b981 b717 )
    ( on b440 b981 )
    ( on b459 b440 )
    ( on b166 b459 )
    ( on b531 b166 )
    ( on b156 b531 )
    ( on b765 b156 )
    ( on b596 b765 )
    ( on b880 b596 )
    ( on b152 b880 )
    ( on b816 b152 )
    ( on b855 b816 )
    ( on b357 b855 )
    ( on b659 b357 )
    ( on b818 b659 )
    ( clear b818 )
  )
  ( :tasks
    ( Make-25Pile b951 b455 b577 b234 b12 b356 b739 b195 b572 b717 b981 b440 b459 b166 b531 b156 b765 b596 b880 b152 b816 b855 b357 b659 b818 )
  )
)
