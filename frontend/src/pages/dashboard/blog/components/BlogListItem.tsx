import moment from "moment";
import { useNavigate } from "react-router-dom";

export default function BlogListItem({ blog }: { blog: any }) {
  const navigate = useNavigate();
  return (
    <tr
      key={blog?.blogId}
      className="cursor-pointer"
      onClick={() => {
        navigate(`/admin/blogs/detail/${blog?.blogId}`);
      }}
    >
      <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
        {blog?.blogId}
      </td>
      <td className="px-6 py-4 w-[400px] text-sm text-gray-500">
        {blog?.title}
      </td>
      <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
        {blog?.authorName}
      </td>
      <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
        {moment(blog?.createdAt).format("MMMM Do, YYYY")}
      </td>
      <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
        Available
      </td>
    </tr>
  );
}
