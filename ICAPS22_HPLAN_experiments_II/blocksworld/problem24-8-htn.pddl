( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b909 - block
    b587 - block
    b763 - block
    b174 - block
    b821 - block
    b349 - block
    b998 - block
    b754 - block
    b95 - block
    b307 - block
    b311 - block
    b866 - block
    b579 - block
    b653 - block
    b20 - block
    b819 - block
    b346 - block
    b195 - block
    b271 - block
    b697 - block
    b729 - block
    b88 - block
    b275 - block
    b92 - block
    b51 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b909 )
    ( on b587 b909 )
    ( on b763 b587 )
    ( on b174 b763 )
    ( on b821 b174 )
    ( on b349 b821 )
    ( on b998 b349 )
    ( on b754 b998 )
    ( on b95 b754 )
    ( on b307 b95 )
    ( on b311 b307 )
    ( on b866 b311 )
    ( on b579 b866 )
    ( on b653 b579 )
    ( on b20 b653 )
    ( on b819 b20 )
    ( on b346 b819 )
    ( on b195 b346 )
    ( on b271 b195 )
    ( on b697 b271 )
    ( on b729 b697 )
    ( on b88 b729 )
    ( on b275 b88 )
    ( on b92 b275 )
    ( on b51 b92 )
    ( clear b51 )
  )
  ( :tasks
    ( Make-24Pile b587 b763 b174 b821 b349 b998 b754 b95 b307 b311 b866 b579 b653 b20 b819 b346 b195 b271 b697 b729 b88 b275 b92 b51 )
  )
)
