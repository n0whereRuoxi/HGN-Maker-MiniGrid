( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b582 - block
    b337 - block
    b906 - block
    b814 - block
    b46 - block
    b917 - block
    b153 - block
    b501 - block
    b110 - block
    b555 - block
    b73 - block
    b672 - block
    b91 - block
    b437 - block
    b618 - block
    b154 - block
    b55 - block
    b909 - block
    b650 - block
    b309 - block
    b237 - block
    b993 - block
    b356 - block
    b994 - block
    b625 - block
    b620 - block
    b831 - block
    b80 - block
    b14 - block
    b183 - block
    b723 - block
    b393 - block
    b782 - block
    b455 - block
    b296 - block
    b538 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b582 )
    ( on b337 b582 )
    ( on b906 b337 )
    ( on b814 b906 )
    ( on b46 b814 )
    ( on b917 b46 )
    ( on b153 b917 )
    ( on b501 b153 )
    ( on b110 b501 )
    ( on b555 b110 )
    ( on b73 b555 )
    ( on b672 b73 )
    ( on b91 b672 )
    ( on b437 b91 )
    ( on b618 b437 )
    ( on b154 b618 )
    ( on b55 b154 )
    ( on b909 b55 )
    ( on b650 b909 )
    ( on b309 b650 )
    ( on b237 b309 )
    ( on b993 b237 )
    ( on b356 b993 )
    ( on b994 b356 )
    ( on b625 b994 )
    ( on b620 b625 )
    ( on b831 b620 )
    ( on b80 b831 )
    ( on b14 b80 )
    ( on b183 b14 )
    ( on b723 b183 )
    ( on b393 b723 )
    ( on b782 b393 )
    ( on b455 b782 )
    ( on b296 b455 )
    ( on b538 b296 )
    ( clear b538 )
  )
  ( :goal
    ( and
      ( clear b582 )
    )
  )
)
